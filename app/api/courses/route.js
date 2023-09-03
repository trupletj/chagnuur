import { NextResponse } from "next/server";
import { cookies } from "next/headers";

export async function GET(request) {
  const res = await fetch("https://admin.chagnuur.mn/api/course/find", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      modelName: "Course",
      id: 1,
      select: "*",
      relations: ["full_topics"],
    }),
  });
  const data = await res.json();

  return NextResponse.json(data);
}
