import React from "react";
import Image from "next/image";

async function getCourses() {
  fetch("http://localhost:3000/api/courses");

  // console.log(res);
}

async function Courses() {
  getCourses();

  return (
    <div className="w-full ">
      <div className="grid grid-cols-4 gap-4">
        <div className="col-span-1 bg-white border rounded-md overflow-hidden ">
          <div className="flex flex-col items-center justify-between">
            <div className="relative aspect-video w-full">
              <Image
                src="https://picsum.photos/300/200"
                fill
                style={{ objectFit: "cover" }}
              />
              <div className="flex flex-col">
                <div className="">Name</div>
                <div className="">others</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Courses;
