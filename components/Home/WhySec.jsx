import React from "react";
import Image from "next/image";
import easy from "assets/Easy.svg";
import effective from "assets/Effective.svg";
import reliable from "assets/Reliable.svg";

function WhySec() {
  return (
    <div className="w-full py-[64px]">
      <div className="container flex flex-col justify-center space-y-10">
        <h1 className="text-[28px] font-[700] text-center">
          Яагаад Chagnuur.mn гэж?
        </h1>
        <ul className="flex flex-col md:flex-row space-y-6 md:space-y-0 text-[28px] font-[700] justify-between w-full max-w-[1024px] mx-auto">
          <li className="flex flex-col items-center">
            <div className="w-56 h-56 relative ">
              <Image src={easy} alt="alt" fill style={{ objectFit: "cover" }} />
            </div>
            <h1 className="">Хэрэглэхэд хялбар</h1>
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
            <h1 className="">Үр дүнтэй боловсрол</h1>
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
            <h1 className="">Найдвартэй эх сурвалж</h1>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default WhySec;
