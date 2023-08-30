import React from "react";
import Image from "next/image";

function Courses() {
  return (
    <div className="w-full ">
      <div className="grid grid-cols-4 gap-4">
        <div className="col-span-1 bg-white border rounded-md overflow-hidden ">
          <div className="flex items-center justify-between">
            <div className="relative aspect-video w-full">
              <Image
                src="https://picsum.photos/300/200"
                fill
                style={{ objectFit: "cover" }}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Courses;
