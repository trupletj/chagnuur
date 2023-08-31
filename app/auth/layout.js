import React from "react";
import Logo from "components/Logo";
export default function AuthLayout({ children }) {
  return (
    <div className=" w-full h-screen flex items-start justify-start bg-white">
      <div className="w-full md:w-2/3">
        <div className="px-10 py-5">
          <Logo />
        </div>
        {children}
      </div>
      <div className="w-1/3 h-full bg-[#fed4d7] hidden md:block"></div>
    </div>
  );
}
