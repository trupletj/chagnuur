"use client";
import { useState, useEffect, useRef } from "react";
import { useSession } from "next-auth/react";

import Link from "next/link";
import { usePathname } from "next/navigation";
import NavbarUserButton from "./UserProfile/NavbarUserButton";
import Logo from "./Logo";

//hooks
// import useWindowSize from "hooks/useWindowSize";
import { useOutsideAlerter } from "hooks/useClickEvents";

export default function Header() {
  const wrapperRef = useRef(null);
  const buttonRef = useRef(null);
  const activeClass = "bg-[#edeff2] ";
  const [navbar, setNavbar] = useState(false);
  useOutsideAlerter(wrapperRef, buttonRef, setNavbar);
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
            ? "bg-[#001540] text-black md:text-white"
            : "bg-[#001540]/[0] text-black md:text-white"
          : "bg-white text-[#4e545f] shadow-[0_0_12px_rgba(29,23,41,0.05)]"
      }`}
    >
      <div className="justify-start container items-center flex space-x-2 relative h-full">
        <div>
          <Logo />
        </div>
        <div
          ref={wrapperRef}
          className={`absolute lg:relative  right-5 lg:right-0  lg:top-[1px] top-[60px] shadow-[0_6px_32px_rgba(23,29,41,0.1)]  lg:shadow-none bg-white lg:bg-opacity-0  w-[225px] lg:w-full   rounded-[12px] lg:rounded-none p-4 lg:p-0 lg:flex ${
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
                  <Link href="/dashboard">Dashboard</Link>
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
          <NavbarUserButton pathname={pathname} />
        </div>
        <div className="lg:hidden flex items-center">
          <button
            ref={buttonRef}
            className={`p-2 text-gray-700 rounded-md outline-none focus:border-gray-400 focus:border ${
              pathname === "/" && "text-white"
            }`}
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
