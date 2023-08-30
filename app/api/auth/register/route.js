// import client from "lib/prisma";
import { PrismaClient } from "@prisma/client";

import { hash } from "bcryptjs";
import { NextResponse } from "next/server";

export async function POST(req) {
  const client = PrismaClient();

  try {
    const { name, email, password } = await req.json();

    const hashed_password = hash(password);

    const user = await client.user.create({
      data: {
        name,
        email: email.toLowerCase(),
        password: hashed_password,
      },
    });

    return NextResponse.json({
      user: {
        name: user.name,
        email: user.email,
      },
    });
  } catch (error) {
    return new NextResponse(
      JSON.stringify({
        status: "error",
        message: error.message,
      }),
      { status: 500 }
    );
  }
}
