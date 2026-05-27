import { z } from 'zod';

const environmentSchema = z.object({
  NODE_ENV: z
    .enum(['development', 'test', 'staging', 'production'])
    .default('development'),
  APP_NAME: z.string().min(1).default('snuggle-api'),
  PORT: z.coerce.number().int().positive().default(8080),
  CORS_ORIGINS: z.string().default('http://localhost:3000,http://localhost:5173'),
});

export type AppEnvironment = {
  nodeEnv: 'development' | 'test' | 'staging' | 'production';
  appName: string;
  port: number;
  corsOrigins: string[];
};

export const loadEnvironment = (): AppEnvironment => {
  const parsed = environmentSchema.safeParse(process.env);

  if (!parsed.success) {
    const issueSummary = parsed.error.issues
      .map((issue) => `${issue.path.join('.') || 'env'}: ${issue.message}`)
      .join('; ');
    throw new Error(`Invalid environment configuration: ${issueSummary}`);
  }

  return {
    nodeEnv: parsed.data.NODE_ENV,
    appName: parsed.data.APP_NAME,
    port: parsed.data.PORT,
    corsOrigins: parsed.data.CORS_ORIGINS.split(',')
      .map((origin) => origin.trim())
      .filter((origin) => origin.length > 0),
  };
};
