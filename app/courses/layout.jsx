import React from "react";
import Header from "components/Header";
export default function CoursesLayout({ children }) {
  return (
    <div className="w-full mt-[80px]">
      <Header />
      {children}
    </div>
  );
}
