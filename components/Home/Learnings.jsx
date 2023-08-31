"use client";
import React, { useRef, useState, useLayoutEffect } from "react";
import { motion } from "framer-motion";

const data = [
  {
    title: "123 ",
    list: ["1", "2", "1", "2", "1", "2", "1", "2", "1", "2", "1", "2"],
  },
  {
    title: " 321",
    list: ["1", "2", "1", "2", "1", "2", "1", "2", "1", "2", "1"],
  },
  {
    title: " 123",
    list: ["1", "2", "1", "2", "1", "2", "1", "2", "1", "2", "1"],
  },
  {
    title: "321 ",
    list: ["1", "2", "1", "2", "1", "2", "1", "2", "1", "2", "1"],
  },
  {
    title: "123 ",
    list: ["1", "2", "1", "2", "1", "2", "1", "2", "1", "2", "1"],
  },
  { title: "123 ", list: ["1", "2"] },
  { title: "12313 231 ", list: ["1", "2"] },
];

function Learnings() {
  const carouselRef = useRef(null);

  const [isFirst, setIsFirst] = useState(true);

  const scrollLeft = () => {
    if (
      carouselRef.current.scrollLeft >
      carouselRef.current.firstChild.clientWidth
    ) {
      carouselRef.current.scrollLeft -=
        carouselRef.current.firstChild.clientWidth;
      console.log("SS", carouselRef.current.scrollLeft);
    } else {
      setIsFirst(true);
    }
  };
  const scrollRight = () => {
    if (
      carouselRef.current.scrollLeft < carouselRef.current.lastChild.offsetLeft
    ) {
      carouselRef.current.scrollLeft +=
        carouselRef.current.firstChild.clientWidth;
      console.log("SS", carouselRef.current.scrollLeft);
    }
    setIsFirst(false);
  };

  return (
    <div className="w-full py-20 pl-[150px]">
      <div className="grid grid-cols-4 w-full space-x-6">
        <motion.div
          className="col-span-1 flex flex-col items-start"
          initial={{ opacity: 0, y: 200, scale: 0.5 }}
          whileInView={{ opacity: 1, y: 0, scale: 1 }}
          transition={{ duration: 0.5 }}
        >
          <h1 className="font-[700] text-[40px] leading-[52px] ">
            Өнөөдөр ямар чиглэлээр суралцах вэ?
          </h1>
          <p className="mt-2">Хичээлүүд байнга шинэчлэгдэх болно</p>
          <button className="py-[0.6rem] px-[1.5rem] bg-[#f44f6c] rounded-xl text-white font-[600] text-[1.25rem] mt-4 hover:bg-[#d70e30]">
            Get started
          </button>
        </motion.div>
        <div className=" col-span-3 flex">
          {isFirst ? (
            <div className="relative w-[150px] left-[66px] h-full flex items-center  z-10 "></div>
          ) : (
            <div className="relative w-[150px] left-[66px] h-full flex items-center left-bg z-10 left-bg">
              <button
                className="rounded-full py-2 px-2 bg-[#001540] text-white"
                onClick={() => scrollLeft()}
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  strokeWidth={2}
                  stroke="currentColor"
                  className="w-8 h-8"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    d="M15.75 19.5L8.25 12l7.5-7.5"
                  />
                </svg>
              </button>
            </div>
          )}
          <ul
            ref={carouselRef}
            className="grid grid-flow-col space-x-4 overflow-x-scroll scroll-smooth  snap-x  items-start relative no-scrollbar"
          >
            {data.map((data, i) => (
              <li className="bg-white rounded-xl w-[300px] snap-start flex-shrink-0 break-words p-[16px]">
                <h1> {data.title}</h1>
                {data.list.map((_, i) => (
                  <p>{_}</p>
                ))}
              </li>
            ))}
          </ul>
          <div className="relative right-[50px] w-[150px] h-full flex items-center bg-red-200 z-10 right-bg">
            <button
              className="rounded-full w-12 h-12 p-2 bg-[#001540] text-white"
              onClick={() => scrollRight()}
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                strokeWidth={2}
                stroke="currentColor"
                className="w-8 h-8"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M8.25 4.5l7.5 7.5-7.5 7.5"
                />
              </svg>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Learnings;
