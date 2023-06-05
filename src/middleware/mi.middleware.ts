import { Injectable, NestMiddleware } from '@nestjs/common';
import { Request, Response } from 'express';

@Injectable()
export class MiMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: () => void) {
    console.log('-> middleware before');
    next();
    console.log('-> middleware after');
  }
}
