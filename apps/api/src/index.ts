import { Hono } from 'hono';
import { cors } from 'hono/cors';

const app = new Hono();

app.use('*', cors());

app.get('/', (c) => {
  return c.text('Hello Hono!');
});

const routes = app.get('/api/health', (c) => {
  return c.text('API is healthy!');
});

export default app;
export type AppType = typeof routes;
