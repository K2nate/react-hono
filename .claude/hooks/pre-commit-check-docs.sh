#!/bin/bash

# Pre-commit hook to automatically run documentation update agents
# To add new documentation agents, simply add them to the DOCS_AGENTS array

# List of documentation update agents
# Format: "agent_name:document_path:description"
DOCS_AGENTS=(
    "tech-stack-updater:docs/tech-stack.md:Updates technology stack documentation when dependencies change"
    # Future agents can be added here:
    # "api-docs-updater:docs/api.md:Updates API documentation"
    # "readme-updater:README.md:Updates README files"
)

# Use CLAUDE_TOOL_PARAMS if available, otherwise read from stdin
if [ -n "$CLAUDE_TOOL_PARAMS" ]; then
    input="$CLAUDE_TOOL_PARAMS"
else
    input=$(cat)
fi

# Check if this is a git commit command
if echo "$input" | jq -e '.tool == "Bash" and (.parameters.command | test("^git commit"))' > /dev/null 2>&1; then
    echo "========================================" >&2
    echo "📋 Pre-commit Documentation Check" >&2
    echo "========================================" >&2
    
    # Check if any documents need updating
    needs_update=false
    agents_to_run=()
    
    for agent in "${DOCS_AGENTS[@]}"; do
        IFS=':' read -r agent_name doc_path agent_desc <<< "$agent"
        
        # Check if the document file is already staged
        if git diff --cached --name-only | grep -q "^${doc_path}$"; then
            echo "✅ $doc_path is already staged for commit" >&2
        else
            # Check if there are changes that might require doc updates
            # For tech-stack-updater, check if package.json files have changed
            if [[ "$agent_name" == "tech-stack-updater" ]]; then
                if git diff --cached --name-only | grep -E "(package\.json|pnpm-lock\.yaml|yarn\.lock|package-lock\.json|Cargo\.toml|go\.mod|requirements\.txt|Gemfile)" > /dev/null; then
                    echo "⚠️  Dependencies have changed - $doc_path needs update" >&2
                    needs_update=true
                    agents_to_run+=("$agent_name")
                fi
            fi
            # Add more agent-specific checks here for future agents
        fi
    done
    
    if [ "$needs_update" = true ]; then
        echo "" >&2
        echo "🤖 Auto-running documentation update agents..." >&2
        echo "" >&2
        
        # Output JSON to trigger agent execution
        for agent_name in "${agents_to_run[@]}"; do
            echo "" >&2
            echo "Running: $agent_name" >&2
            echo "" >&2
            
            # Create a special message that Claude Code will recognize
            cat <<EOF >&2
[HOOK_ACTION_REQUEST]
Please run the following agent to update documentation:
- Agent: $agent_name
- Reason: Dependencies or relevant files have changed

Use this command:
Task(subagent_type="$agent_name", prompt="Review the changes and update the documentation accordingly", description="Update documentation")

After the agent completes, review the changes and run 'git commit' again.
[/HOOK_ACTION_REQUEST]
EOF
        done
        
        echo "" >&2
        echo "========================================" >&2
        echo "❌ Commit blocked: Documentation needs updating" >&2
        echo "The required agents will be run automatically." >&2
        echo "Please review the changes and commit again." >&2
        echo "========================================" >&2
        
        # Block the commit by returning error
        exit 1
    else
        echo "✅ All documentation is up to date" >&2
        echo "========================================" >&2
        
        # Allow the commit to proceed
        echo "$input"
        exit 0
    fi
else
    # Not a git commit command, pass through
    echo "$input"
fi