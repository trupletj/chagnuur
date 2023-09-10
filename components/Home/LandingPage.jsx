import React from "react";
import Image from "next/image";
import bg from "assets/landing.png";
import Link from "next/link";

function LandingPage() {
  return (
    <div className="w-full relative overflow-hidden">
      <div className="relative w-full h-[670px]  overflow-hidden clip">
        <div className="absolute top-0 left-0  w-full h-[1000px] bg-[#001540]">
          <div className="relative w-full h-full   ">
            <Image
              src={bg}
              alt="Landing page"
              className=" bottom-[300px] md:bottom-[350px] lg:bottom-[200px] image-scale"
              style={{
                position: "absolute",
                transform: "rotate(-7deg)",
              }}
            />
          </div>
        </div>
        <div className="absolute z-10 top-0 left-0 w-full h-full radial ">
          <div className="w-full h-full  flex flex-col container">
            <div className="pt-20 mt-10 w-full  max-w-[800px] mx-auto lg:ml-0">
              <div className="text-6xl lg:text-7xl text-center font-bold text-[#fa888e] leading-[50px] lg:text-left lg:leading-[80px]">
                Анагаах ухааны цахим сургалт
              </div>
              <div className="text-white w-full lg:w-[300px] mt-10 text-center text-[22px] lg:text-left font-[500]">
                Эмч, эмнэлгийн мэргэжилтнүүдийн давтан сургалтын нэгдсэн сайт
              </div>
            </div>
            <div className="mt-10 space-x-0 space-y-10  text-lg flex flex-col lg:flex-row sm:space-x-2 sm:space-y-0 w-full max-w-[400px] mx-auto sm:flex-row sm:max-w-[800px] lg:max-w-[600px] lg:ml-0">
              <Link
                href={"/auth/register"}
                className="rounded-full text-white hover:bg-[#f44f6c] bg-[#fa888e] py-3 px-5  flex-1 lg:flex-none text-center"
              >
                Суралцаж Эхлэх
              </Link>

              <Link
                href={"/auth/register"}
                className="rounded-full text-[#d70e30] hover:bg-[#f8c4cc] bg-[#fde3e7] py-3 px-5 flex-1 lg:flex-none text-center"
              >
                Ausemed organization
              </Link>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default LandingPage;
