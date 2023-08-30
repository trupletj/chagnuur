import React from "react";
import Header from "components/Header";
import WelcomeTitle from "components/WelcomeTitle";
export default function DashboardLayout({ children }) {
  return (
    <>
      <Header />
      <div className="container mt-[80px] space-y-4">
        <WelcomeTitle></WelcomeTitle>
        {children}
      </div>
    </>
  );
}
