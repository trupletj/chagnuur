"use client";
import React from "react";
import { useSession } from "next-auth/react";

function WelcomeTitle() {
  const { data: session, status } = useSession();
  return (
    <div className="flex space-x-2">
      <p className="font-bold text-xl italic">
        Сайн байна уу, {session?.user.name}
      </p>
      <span className="font-bold text-xl"> 👋</span>
    </div>
  );
}

export default WelcomeTitle;