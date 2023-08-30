"use client";
import { useState, useEffect } from "react";
import { useSession } from "next-auth/react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import NavbarUserButton from "./UseraProfile/NavbarUserButton";

import Image from "next/image";
import logo from "assets/logo.png";

export default function Header() {
  const activeClass = "bg-[#edeff2] ";
  const [navbar, setNavbar] = useState(false);
  const { data: session } = useSession();
  const pathname = usePathname();
  //background change
  const [color, setColor] = useState(0);
  useEffect(() => {
    if (typeof window !== "undefined") {
      const handleScroll = (event) => {
        if (window.scrollY >= 20) setColor(true);
        else setColor(false);
      };

      window.addEventListener("scroll", handleScroll);

      return () => {
        window.removeEventListener("scroll", handleScroll);
      };
    }
  }, []);

  return (
    <nav
      className={`w-full fixed top-0 z-30 h-[65px] ${
        pathname === "/"
          ? color
            ? "bg-[#001540] text-white"
            : "bg-[#001540]/[0] text-white"
          : "bg-white text-[#4e545f] shadow-[0_0_12px_rgba(29,23,41,0.05)]"
      }`}
    >
      <div className="justify-start container items-center flex space-x-2 relative h-full">
        <div>
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
              <h2 className="text-2xl font-bold  text-bottom relative bottom-[-5px]">
                Chagnuur.
              </h2>
            </Link>
          </div>
        </div>
        <div
          className={`absolute md:relative  right-5 md:right-0  md:top-[1px] top-[60px] shadow-[0_6px_32px_rgba(23,29,41,0.1)]  md:shadow-none bg-white md:bg-opacity-0  w-[225px] md:w-full   rounded-[12px] md:rounded-none p-4 md:p-0 md:flex ${
            navbar ? "block" : "hidden"
          }`}
        >
          <div
            className={`flex-1 justify-self-center   md:block md:pb-0 md:mt-0`}
          >
            <ul className="items-center justify-center md:justify-start space-y-2 md:flex md:space-x-2 md:space-y-0 text-sm leading-[20px] font-[600] text-[1rem] ">
              {session && (
                <li
                  className={`px-4 h-8 flex items-center rounded-2xl ${
                    pathname === "/dashboard" && activeClass
                  }`}
                >
                  <Link href="/dashboard">Нүүр</Link>
                </li>
              )}
              <li
                className={`px-4 h-8 flex items-center rounded-2xl ${
                  pathname === "/courses" && activeClass
                }`}
              >
                <Link href="/courses">Сургалт</Link>
              </li>
              <li
                className={`px-4 h-8 flex items-center rounded-2xl ${
                  pathname === "/blogs" && activeClass
                }`}
              >
                <Link href="/blogs">Статистик</Link>
              </li>
              <li
                className={`px-4 h-8 flex items-center rounded-2xl ${
                  pathname === "/about" && activeClass
                }`}
              >
                <Link href="/about">Бидний тухай</Link>
              </li>
              <li
                className={`px-4 h-8 flex items-center rounded-2xl ${
                  pathname === "/contact" && activeClass
                }`}
              >
                <Link href="/contact">Анхны тусламж</Link>
              </li>
            </ul>
          </div>
        </div>
        <div className="flex-1 flex items-center justify-end">
          <NavbarUserButton />
        </div>
        <div className="md:hidden flex items-center">
          <button
            className="p-2 text-gray-700 rounded-md outline-none focus:border-gray-400 focus:border"
            onClick={() => setNavbar(!navbar)}
          >
            {navbar ? (
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="w-6 h-6 "
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fillRule="evenodd"
                  d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                  clipRule="evenodd"
                />
              </svg>
            ) : (
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="w-6 h-6 "
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                strokeWidth={2}
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  d="M4 6h16M4 12h16M4 18h16"
                />
              </svg>
            )}
          </button>
        </div>
      </div>
    </nav>
  );
}
