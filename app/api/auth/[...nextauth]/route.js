import NextAuth from "next-auth";
import { options } from "./options";

export const handler = NextAuth(options);

export { handler };
