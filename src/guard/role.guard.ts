import {
  CanActivate,
  ExecutionContext,
  Injectable,
  Inject,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { Reflector } from '@nestjs/core';

@Injectable()
export class RoleGuard implements CanActivate {
  @Inject(Reflector)
  private readonly reflector: Reflector;

  canActivate(
    context: ExecutionContext,
  ): boolean | Promise<boolean> | Observable<boolean> {
    const ctx = context.getType();
    console.log('-> ctx', ctx);
    const classMetadata = this.reflector?.get('role', context.getClass());
    const methodMetadata = this.reflector?.get('role', context.getHandler());
    console.log('-> methodMetadata', methodMetadata);

    if (methodMetadata === 'admin' || methodMetadata?.includes('admin')) {
      return true;
    } else {
      throw new HttpException('没有权限,必须是admin', HttpStatus.FORBIDDEN);
    }
  }
}
