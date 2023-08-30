"use client";
import React from "react";
import { useSearchParams } from "next/navigation";
import { useSession } from "next-auth/react";

function page() {
  const { data: session } = useSession();
  const searchParams = useSearchParams();

  const error = searchParams.get("error");
  return <div>{error && error}</div>;
}

export default page;
