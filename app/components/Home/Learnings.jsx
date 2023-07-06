"use client";
import React, { useRef, useState } from "react";

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
  { title: "123 ", list: ["1", "2"] },
  { title: " 321", list: ["1", "2"] },
  { title: " 123", list: ["1", "2"] },
  { title: "321 ", list: ["1", "2"] },
  { title: "123 ", list: ["1", "2"] },
  { title: "123 ", list: ["1", "2"] },
  { title: "12313 231 ", list: ["1", "2"] },
];

function Learnings() {
  return (
    <div className="w-full py-20 pl-[150px]">
      <div className="grid grid-cols-4 w-full px-10 space-x-6">
        <div className="col-span-1 flex flex-col items-start">
          <h1 className="font-[700] text-[40px] leading-[52px] ">
            What will you learn today?
          </h1>
          <p className="mt-2">New learning added every week!</p>
          <button className="py-[0.6rem] px-[1.5rem] bg-[#f44f6c] rounded-xl text-white font-[600] text-[1.25rem] mt-4 hover:bg-[#d70e30]">
            Get started
          </button>
        </div>
        <ul className="grid grid-flow-col space-x-4 overflow-x-scroll scroll-smooth  snap-x col-span-3 items-start">
          {data.map((data, i) => (
            <li className="bg-white rounded-xl w-[300px] snap-start flex-shrink-0 break-words p-[16px]">
              <h1> {data.title}</h1>
              {data.list.map((_, i) => (
                <p>{_}</p>
              ))}
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}

export default Learnings;
