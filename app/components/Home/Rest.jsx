import React from "react";
import bg from "@/app/assets/landing.png";

function Rest() {
  return (
    <div className="w-full   bg-[#001540]">
      <div className="container h-[396px]">
        <div
          className="w-full"
          style={{
            backgroundImage: `url(${bg.src})`,
            width: "100%",
            height: "100%",
            backgroundSize: "contain",
          }}
        ></div>
      </div>
    </div>
  );
}

export default Rest;
