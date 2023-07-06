import React from "react";
import Image from "next/image";
import easy from "@/app/assets/Easy.svg";
import effective from "@/app/assets/Effective.svg";
import reliable from "@/app/assets/Reliable.svg";

function WhySec() {
  return (
    <div className="w-full py-[64px]">
      <div className="container flex flex-col justify-center space-y-10">
        <h1 className="text-[28px] font-[700] text-center">
          Why you'll love learning with Ausmed
        </h1>
        <ul className="flex text-[28px] font-[700] justify-between w-full max-w-[1024px] mx-auto">
          <li className="flex flex-col items-center">
            <div className="w-56 h-56 relative c">
              <Image src={easy} alt="alt" fill style={{ objectFit: "cover" }} />
            </div>
            <h1 className="">Easy to use</h1>
          </li>
          <li className="flex flex-col items-center">
            <div className="w-56 h-56 relative">
              <Image
                src={effective}
                alt="alt"
                fill
                style={{ objectFit: "cover" }}
              />
            </div>
            <h1 className="">Effective education</h1>
          </li>
          <li className="flex flex-col items-center">
            <div className="w-56 h-56 relative">
              <Image
                src={reliable}
                alt="alt"
                fill
                style={{ objectFit: "cover" }}
              />
            </div>
            <h1 className="">Reliable information</h1>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default WhySec;
