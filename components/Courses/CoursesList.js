"use client";
import React from "react";
import Link from "next/link";
import Image from "next/image";
import Skeleton from "components/Skeleton";

const fetcher = (...args) => fetch(...args).then((res) => res.json());
function CoursesList(props) {
  return (
    <div>
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-2 w-full">
        {props.data.map((course) => (
          <div
            key={course.name}
            className="col-span-1 bg-white border rounded-md overflow-hidden relative"
          >
            <div className="flex flex-col justify-between h-full">
              <Link href={`/courses/${course.id}`} className="flex flex-col">
                <div className="relative aspect-[16/9] w-full">
                  <Image
                    alt="Picture of the Course"
                    src={course.image}
                    fill
                    style={{ objectFit: "cover" }}
                  />
                </div>
                <div className="text-sm relative h-[3.5rem my-2 px-3">
                  {course.name}
                </div>
              </Link>
              <div className="px-3 mb-2">others</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export default CoursesList;
