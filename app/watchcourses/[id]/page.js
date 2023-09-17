"use client";
import React, { useState } from "react";
import classNames from "classnames";
function WatchCourses() {
  const [collapsed, setSidebarCollapsed] = useState(false);
  return (
    <div className="flex flex-row w-full overflow-hidden">
      <div className="w-full h-screen bg-red-300 relative">
        <div className="m-10 flex">
          {/* Content here */}
          // video content here
        </div>
      </div>
      <div
        className={classNames({
          "min-w-[300px] z-10  h-screen bg-gray-200 absolute  top-0 md:relative": true,
          "right-0": collapsed,
          "right-[-300px]": !collapsed,
          "transition-all duration-500": true,
        })}
      >
        <div
          onClick={() => setSidebarCollapsed(!collapsed)}
          className="z-50 absolute right-[100%] mr-2 top-0 mt-2 p-2 rounded bg-gray-200  md:hidden"
        >
          <div className="w-[15px] h-[15px]">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 24 24"
              fill="currentColor"
              _ngcontent-ausmed-cpd-state-c89
              className="sl-sm"
              style={{ position: "relative", bottom: 2 }}
            >
              <rect x=".5" y="2.5" width={23} height={3} rx={1} />
              <rect x=".5" y="10.5" width={23} height={3} rx={1} />
              <rect x=".5" y="18.5" width={23} height={3} rx={1} />
            </svg>
          </div>
        </div>
        <div className="flex-col space-y-2  ">
          <ul className="">
            <li className="p-2 border-b-[1px] border-gray-300 ">Course 1</li>
            <li className="p-2 border-b-[1px] border-gray-300">Course 1</li>
            <li className="p-2 border-b-[1px] border-gray-300">Course 1</li>
            <li className="p-2 border-b-[1px] border-gray-300">Course 1</li>
          </ul>
        </div>
      </div>
    </div>
  );
}

export default WatchCourses;
