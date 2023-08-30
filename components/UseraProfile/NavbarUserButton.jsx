"use client";
import React from "react";
import Link from "next/link";
import { useSession } from "next-auth/react";

function NavbarUserButton() {
  const { data: session, status } = useSession();
  if (status === "loading") return null;
  if (!session)
    return (
      <Link
        href={"/api/auth/signin"}
        className="rounded-full text-white bg-[#f44f6c] hover:bg-[#fa888e] py-2 px-5   lg:flex-none "
      >
        Нэвтрэх
      </Link>
    );
  return (
    <div className="relative flex space-x-1">
      <div className="rounded-full text-white bg-[#f44f6c] hover:bg-[#fa888e] h-9 px-4 flex items-center  cursor-pointer">
        Төлбөр
      </div>
      <div className=" w-9 h-9 rounded-full bg-[#f4b455] text-white font-bold flex justify-center items-center">
        {session?.user.name[0].toUpperCase()}
      </div>
    </div>
  );
}

export default NavbarUserButton;
