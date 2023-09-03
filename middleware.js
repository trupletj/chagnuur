import { getToken } from "next-auth/jwt";

export { default } from "next-auth/middleware";

export const config = { matcher: ["/dashboard/:path*"] };

console.log("middleware.js");
