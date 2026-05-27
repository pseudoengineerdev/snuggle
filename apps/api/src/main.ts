import { Logger, ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import helmet from 'helmet';
import { AppModule } from './app.module';
import { loadEnvironment } from './common/config/environment';

async function bootstrap(): Promise<void> {
  const env = loadEnvironment();
  const app = await NestFactory.create(AppModule, {
    bufferLogs: true,
  });

  app.useLogger(new Logger(env.appName));
  app.use(
    helmet({
      crossOriginResourcePolicy: { policy: 'cross-origin' },
    }),
  );

  app.enableCors({
    origin: env.corsOrigins,
    credentials: true,
    methods: ['GET', 'POST', 'PATCH', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization', 'X-Request-Id'],
  });

  app.setGlobalPrefix('v1');
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
      transformOptions: { enableImplicitConversion: true },
      stopAtFirstError: true,
    }),
  );

  await app.listen(env.port);

  const logger = new Logger(env.appName);
  logger.log(`API running in ${env.nodeEnv} mode on port ${env.port}`);
}

void bootstrap();
