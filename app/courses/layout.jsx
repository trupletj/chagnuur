import React from "react";
import Header from "components/Header";

export default function CoursesLayout({ children }) {
  return (
    <>
      <Header />
      <div className="relative top-20 container">
        <div className="w-full max-w-[1140px] mx-auto space-y-4">
          {children}
        </div>
      </div>
    </>
  );
}
