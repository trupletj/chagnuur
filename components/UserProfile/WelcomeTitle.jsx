"use client";
import React from "react";

function WelcomeTitle({ session }) {
  //   const { data: session, status } = useSession();
  return (
    <div className="flex space-x-2">
      <p className="font-bold text-xl italic">
        Сайн байна уу, {session?.user?.name}
      </p>
      <span className="font-bold text-xl"> 👋</span>
    </div>
  );
}

export default WelcomeTitle;
