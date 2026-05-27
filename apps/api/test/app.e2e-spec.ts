import { ValidationPipe } from '@nestjs/common';
import type { INestApplication } from '@nestjs/common';
import { Test } from '@nestjs/testing';
import * as request from 'supertest';
import { AppModule } from '../src/app.module';

describe('App (e2e)', () => {
  let app: INestApplication;

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleRef.createNestApplication();
    app.setGlobalPrefix('v1');
    app.useGlobalPipes(
      new ValidationPipe({
        whitelist: true,
        forbidNonWhitelisted: true,
        transform: true,
        stopAtFirstError: true,
      }),
    );
    await app.init();
  });

  afterAll(async () => {
    await app.close();
  });

  it('/v1/health (GET)', async () => {
    const response = await request(app.getHttpServer()).get('/v1/health').expect(200);

    expect(response.body.status).toBe('ok');
    expect(response.body.service).toBe('snuggle-api');
  });

  it('/v1/care/companion/state-preview validates payload (POST)', async () => {
    await request(app.getHttpServer())
      .post('/v1/care/companion/state-preview')
      .send({
        missedCareDays: 10,
      })
      .expect(400);
  });
});
