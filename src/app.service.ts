import { Injectable } from '@nestjs/common';
import { User } from './entities/db1/user.module';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }
}
