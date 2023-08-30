"use client";
import React from "react";
import { useSession } from "next-auth/react";

function WelcomeTitle() {
  const { data: session, status } = useSession();
  return (
    <div className="font-bold text-xl italic">
      Сайн байна уу, {session?.user.name}
    </div>
  );
}

export default WelcomeTitle;
