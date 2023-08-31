import React from "react";
import Header from "components/Header";
import Footer from "components/Footer";

export default function CoursesLayout({ children }) {
  return (
    <>
      <Header />
      <div className="pt-[80px] pb-[20px] container">
        <div className="w-full max-w-[1140px] mx-auto space-y-4">
          {children}
        </div>
      </div>
      <Footer />
    </>
  );
}
