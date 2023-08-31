import React from "react";
import Header from "components/Header";
import WelcomeTitle from "components/WelcomeTitle";

import { getServerSession } from "next-auth/next";
import { options } from "/app/api/auth/[...nextauth]/options";
export default async function DashboardLayout({ children }) {
  const session = await getServerSession(options);
  return (
    <>
      <Header />
      <div className="max-w-[1140px] w-full mx-auto mt-[80px] space-y-4">
        <WelcomeTitle session={session} />
        {children}
      </div>
    </>
  );
}
