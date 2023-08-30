import React from "react";
import Header from "components/Header";
import WelcomeTitle from "components/WelcomeTitle";
export default function DashboardLayout({ children }) {
  return (
    <div className="container mt-[80px] space-y-4">
      <Header />
      <WelcomeTitle></WelcomeTitle>
      {children}
    </div>
  );
}
