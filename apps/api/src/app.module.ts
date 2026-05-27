import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { CareModule } from './care/care.module';
import { CouplesModule } from './couples/couples.module';
import { HealthModule } from './health/health.module';
import { MemoriesModule } from './memories/memories.module';
import { MoodsModule } from './moods/moods.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      expandVariables: true,
    }),
    HealthModule,
    MoodsModule,
    CouplesModule,
    MemoriesModule,
    CareModule,
  ],
})
export class AppModule {}
