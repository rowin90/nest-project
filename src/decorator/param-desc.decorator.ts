import { createParamDecorator, ExecutionContext } from '@nestjs/common';

export const MyHeader = createParamDecorator(
  (key: string, ctx: ExecutionContext) => {
    const request: Request = ctx.switchToHttp().getRequest();

    return key ? request.headers[key] : request.headers;
  },
);
