import React from "react";

const data = [
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
    <div className="w-full py-20">
      <div className="flex">
        <div className="">What will you learn today </div>
        <div className="">
          <ul>
            <li></li>
          </ul>
        </div>
      </div>
    </div>
  );
}

export default Learnings;
