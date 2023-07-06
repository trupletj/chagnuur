import React from "react";
import Image from "next/image";
import learn from "@/app/assets/learn-your-way.svg";
import keep from "@/app/assets/keep-up-to-date.svg";
import convenient from "@/app/assets/convenient-for-you.svg";

function Illustration() {
  return (
    <div className="w-full py-20">
      <div className="container">
        <div className="">
          <ul className="flex flex-col">
            <li className="flex">
              <div className="">
                <h1>Learn your way</h1>
                <span>Video courses</span>
                <span>Lectures</span>
                <span>Articles</span>
              </div>
              <div className="relative">
                <Image src={learn} alt="learn" />
              </div>
            </li>
            <li className="flex">
              <div className="">
                <h1>Learn your way</h1>
                <span>Video courses</span>
                <span>Lectures</span>
                <span>Articles</span>
              </div>
              <div className="relative">
                <Image src={keep} alt="learn" />
              </div>
            </li>
            <li className="flex">
              <div className="">
                <h1>Learn your way</h1>
                <span>Video courses</span>
                <span>Lectures</span>
                <span>Articles</span>
              </div>
              <div className="relative">
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
