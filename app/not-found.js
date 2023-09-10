import React from "react";
import Image from "next/image";
import Link from "next/link";
import img from "assets/doc-head-404.png";

function notFound() {
  return (
    <div className="w-full h-screen flex items-center justify-center">
      <div className="space-y-2 flex flex-col items-start">
        <h1 className="font-bold text-3xl">Уучлаарай, Хуудас олдсонгүй ...</h1>
        <p>Хуудас олдсонгүй</p>
        <Link
          href="/"
          className="rounded-2xl bg-red-400 px-4 py-2 hover:bg-red-300  text-white cursor-pointer"
        >
          Буцах
        </Link>
      </div>
      <div>
        <div className="relative w-[400px] h-[600px]">
          <Image src={img} fill alt="404" />
        </div>
      </div>
    </div>
  );
}

export default notFound;
