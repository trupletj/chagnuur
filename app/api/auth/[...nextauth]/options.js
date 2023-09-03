import CredentialsProvider from "next-auth/providers/credentials";

export const options = {
  // Configure one or more authentication providers
  providers: [
    CredentialsProvider({
      name: "Email",
      credentials: {
        email: {
          label: "Email",
          type: "email",
          placeholder: "example@example.com",
        },
        password: {
          label: "Password",
          type: "password",
          placeholder: "password",
        },
      },
      async authorize(credentials) {
        const { email, password } = credentials;

        const response = await fetch(`${process.env.API_URL}/api/auth/login`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            email,
            password,
            is_api: 1,
          }),
        });

        if (response.status == 200) {
          const json = await response.json();

          if (json?.user && json?.accessToken) {
            const { accessToken, user } = json;
            const newUser = { ...user, accessToken };
            return newUser;
          } else {
            return null;
          }
        }
      },
    }),
    // ...add more providers here
  ],

  callbacks: {
    async jwt({ token, user }) {
      // the user object is what returned from the Credentials login, it has `accessToken` from the server `/login` endpoint
      // assign the accessToken to the `token` object, so it will be available on the `session` callback

      return { ...token, ...user };
    },

    async session({ session, user, token }) {
      // the token object is what returned from the `jwt` callback, it has the `accessToken` that we assigned before
      // Assign the accessToken to the `session` object, so it will be available on our app through `useSession` hooks

      session.user = token;

      return session;
    },
  },
  pages: {
    signIn: "/auth/signin",
    error: "/auth/error", // Error code passed in query string as ?error=
  },

  // theme: {
  //   colorScheme: "light", // "auto" | "dark" | "light"
  //   brandColor: "#f44f6c", // Hex color code
  //   logo: "/assets/logo.png", // Absolute URL to image
  //   buttonText: "#ffffff", // Hex color code
  // },
};
