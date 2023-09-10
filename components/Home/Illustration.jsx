import React from "react";
import Image from "next/image";
import learn from "assets/learn-your-way.svg";
import keep from "assets/keep-up-to-date.svg";
import convenient from "assets/convenient-for-you.svg";

function Illustration() {
  return (
    <div className="w-full py-20">
      <div className="container">
        <div className="w-full max-w-[1024px] mx-auto">
          <ul className="flex flex-col space-y-20">
            <li className="grid grid-cols-10">
              <div className="col-span-10 md:col-span-4 flex flex-col items-start justify-center font-[400] text-[22px]">
                <h1 className="font-[700] text-[40px] leading-[52px]">
                  Бие даан суралцах
                </h1>
                <spa>Видео хичээл</spa>
                <span>Лекц</span>
                <span>Өгүүллэг</span>
              </div>
              <div className="relative col-span-10 md:col-span-6">
                <Image src={learn} alt="learn" />
              </div>
            </li>
            <li className="grid grid-cols-10 ">
              <div className="col-span-10 md:col-span-4 flex flex-col items-start justify-center font-[400] text-[22px]">
                <h1 className="font-[700] text-[40px] leading-[52px]">
                  Хамгийн чанартай
                </h1>
                <spa>Бүх сургалтынхаа чанарт байнга анхаарч сайжруулдаг</spa>
              </div>
              <div className="relative col-span-10 md:col-span-6">
                <Image src={keep} alt="learn" />
              </div>
            </li>
            <li className="grid grid-cols-10 ">
              <div className="col-span-10 md:col-span-4 flex flex-col items-start justify-center font-[400] text-[22px]">
                <h1 className="font-[700] text-[40px] leading-[52px]">
                  Хэрэглэхд хялбар
                </h1>
                <spa>Бүх төрлийн төхөөрөмжөөс хандах боломж</spa>
              </div>
              <div className="relative col-span-10 md:col-span-6">
                <Image src={convenient} alt="learn" />
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  );
}

export default Illustration;
