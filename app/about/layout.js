import React from "react";
import Header from "components/Header";

export default async function AboutLayout({ children }) {
  return (
    <>
      <Header />
      <div className="w-full ">{children}</div>
    </>
  );
}
