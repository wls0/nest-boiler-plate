import { NestFactory } from '@nestjs/core';

import { AppModule } from './app.module';
import { Env } from './common/types/common.type';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(Env.PORT);
}
bootstrap();
