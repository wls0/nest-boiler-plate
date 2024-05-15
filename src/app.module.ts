import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_FILTER, APP_INTERCEPTOR } from '@nestjs/core';
import { WinstonModule } from 'nest-winston';
import winston from 'winston';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ErrorExceptionFilter } from './common/filters/error.exception';
import { LoggingInterceptor } from './common/interceptors/logging.interceptor';
import { SuccessInterceptor } from './common/interceptors/success.interceptor';

@Module({
  imports: [
    WinstonModule.forRoot({
      format: winston.format.json(),
      level: 'info',
      transports: [new winston.transports.Console()],
    }),
    ConfigModule.forRoot({
      envFilePath: ['config/.env'],
      isGlobal: true,
    }),
  ],
  controllers: [AppController],
  providers: [
    AppService,
    {
      provide: APP_INTERCEPTOR,
      useClass: LoggingInterceptor,
    },
    {
      provide: APP_INTERCEPTOR,
      useClass: SuccessInterceptor,
    },
    {
      provide: APP_FILTER,
      useClass: ErrorExceptionFilter,
    },
  ],
})
export class AppModule {}
