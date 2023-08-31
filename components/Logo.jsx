import React from "react";
import Image from "next/image";
import logo from "assets/logo.png";
import Link from "next/link";

function Logo() {
  return (
    <div className="flex items-center justify-between mr-10">
      <Link href="/" className="flex space-x-1 items-end">
        <div className="relative w-8 h-8">
          <Image
            src={logo}
            fill
            style={{ objectFit: "contain" }}
            alt="Chagnuur logo"
          />
        </div>
        <h2 className="text-2xl font-bold  text-bottom relative bottom-[-5px] hidden md:block">
          Chagnuur.
        </h2>
      </Link>
    </div>
  );
}

export default Logo;
