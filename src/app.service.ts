import { Injectable } from '@nestjs/common';
import { User } from './entities/user.module';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }
}
