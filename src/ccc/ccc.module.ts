import { Module, Global } from '@nestjs/common';
import { CccService } from './ccc.service';
import { CccController } from './ccc.controller';

@Global()
@Module({
  controllers: [CccController],
  providers: [CccService],
  exports: [CccService],
})
export class CccModule {}
