import React from "react";
import Header from "components/Header";
export default function CoursesLayout({ children }) {
  return (
    <>
      <Header />
      <div className="relative top-20 container">{children}</div>
    </>
  );
}
