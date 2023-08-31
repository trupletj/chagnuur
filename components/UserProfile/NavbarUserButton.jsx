"use client";
import React, { useRef, useEffect } from "react";
import Link from "next/link";
import { useSession, signOut } from "next-auth/react";
import { useOutsideAlerter } from "hooks/useClickEvents";

function NavbarUserButton({ pathname }) {
  const wrapperRef = useRef(null);
  const buttonRef = useRef(null);
  const { data: session, status } = useSession();
  const [show, setShow] = React.useState(false);

  useOutsideAlerter(wrapperRef, setShow);
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
      <div className="rounded-full text-white bg-[#f44f6c] hover:bg-[#fa888e] h-9 px-4 flex items-center  cursor-pointer ">
        Төлбөр
      </div>
      <div
        ref={buttonRef}
        onClick={() => setShow(!show)}
        className=" w-9 h-9 rounded-full bg-[#f4b455] text-white font-bold flex justify-center items-center cursor-pointer"
      >
        {session?.user.name[0].toUpperCase()}
      </div>
      {show && (
        <div
          ref={wrapperRef}
          className="absolute flex flex-col items-start top-[40px] w-[225px] space-y-2 right-0 bg-white p-2 rounded shadow-[0_6px_32px_rgba(23,29,41,0.1)] text-black "
        >
          <button className="flex items-center space-x-1 p-1 rounded">
            <div className="w-4 h-4">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                fill="currentColor"
                stroke="currentColor"
                className="sl-lg"
                style={{ position: "relative", bottom: 1 }}
              >
                <path
                  d="M10.546 2.438a1.957 1.957 0 0 0 2.908 0L14.4 1.4a1.959 1.959 0 0 1 3.41 1.413l-.071 1.4a1.958 1.958 0 0 0 2.051 2.054l1.4-.071a1.959 1.959 0 0 1 1.41 3.41l-1.042.94a1.96 1.96 0 0 0 0 2.909l1.042.94a1.959 1.959 0 0 1-1.413 3.41l-1.4-.071a1.958 1.958 0 0 0-2.056 2.056l.071 1.4A1.959 1.959 0 0 1 14.4 22.6l-.941-1.041a1.959 1.959 0 0 0-2.908 0L9.606 22.6A1.959 1.959 0 0 1 6.2 21.192l.072-1.4a1.958 1.958 0 0 0-2.056-2.056l-1.4.071A1.958 1.958 0 0 1 1.4 14.4l1.041-.94a1.96 1.96 0 0 0 0-2.909L1.4 9.606A1.958 1.958 0 0 1 2.809 6.2l1.4.071a1.958 1.958 0 0 0 2.058-2.06L6.2 2.81A1.959 1.959 0 0 1 9.606 1.4Z"
                  fill="none"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="1.5"
                />
                <path
                  d="M7.5 12.001a4.5 4.5 0 1 0 9 0 4.5 4.5 0 1 0-9 0Z"
                  fill="none"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="1.5"
                />
              </svg>
            </div>
            <span>Тохиргоо</span>
          </button>
          <button className="flex items-center space-x-1 px-1">
            <div className="w-4 h-4">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                fill="currentColor"
                stroke="currentColor"
                className="sl-lg"
                style={{ position: "relative", bottom: 1 }}
              >
                <path
                  d="M9 9a3 3 0 1 1 4 2.829 1.5 1.5 0 0 0-1 1.415v1.006m0 3a.375.375 0 1 0 .375.375.375.375 0 0 0-.375-.375h0"
                  fill="none"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="1.5"
                />
                <path
                  d="M.75 12a11.25 11.25 0 1 0 22.5 0 11.25 11.25 0 1 0-22.5 0Z"
                  fill="none"
                  strokeWidth="1.5"
                />
              </svg>
            </div>
            <span>Тусламж</span>
          </button>
          <button
            className="flex items-center space-x-1 px-1"
            onClick={() => signOut()}
          >
            <div className="w-4 h-4">
              <svg
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
                className="sl-lg"
                style={{ position: "relative", bottom: 1 }}
              >
                <g transform="matrix(1,0,0,1,0,0)">
                  <path
                    d="M7.5 12.004L23.25 12.004"
                    fill="none"
                    stroke="#000000"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="1.5"
                  />
                  <path
                    d="M19.5 15.754L23.25 12.004 19.5 8.254"
                    fill="none"
                    stroke="#000000"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="1.5"
                  />
                  <path
                    d="M15.75,16.5V21a1.437,1.437,0,0,1-1.364,1.5H2.113A1.437,1.437,0,0,1,.75,21V3A1.436,1.436,0,0,1,2.113,1.5H14.386A1.437,1.437,0,0,1,15.75,3V7.5"
                    fill="none"
                    stroke="#000000"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="1.5"
                  />
                </g>
              </svg>
            </div>
            <span>Гарах</span>
          </button>
        </div>
      )}
    </div>
  );
}

export default NavbarUserButton;
