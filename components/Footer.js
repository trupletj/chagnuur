import React from "react";
import Logo from "components/Logo";

function Footer() {
  return (
    <div className="w-full py-10 bg-[#001540] text-white">
      <div className="container">
        <div className="w-full max-w-[1140px] mx-auto flex justify-between">
          <Logo />
          <div className="">2023 он</div>
          {/* <ul className="flex ">
            <li>
              <h1>Help and Feedback</h1>
            </li>
            <li>
              <h1>Online CPD</h1>
            </li>
            <li>
              <h1>Features</h1>
            </li>
            <li>
              <h1>Publications</h1>
            </li>
            <li>
              <h1>Legals</h1>
            </li>
          </ul> */}
        </div>
      </div>
    </div>
  );
}

export default Footer;
