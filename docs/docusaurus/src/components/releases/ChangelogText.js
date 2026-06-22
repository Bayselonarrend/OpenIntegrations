import React from 'react';

export default function ChangelogText({ children }) {
  if (!children) {
    return null;
  }

  const parts = String(children).split(/(`[^`]+`)/g);

  return (
    <>
      {parts.map((part, index) => {
        if (part.startsWith('`') && part.endsWith('`')) {
          return <code key={index}>{part.slice(1, -1)}</code>;
        }

        return <React.Fragment key={index}>{part}</React.Fragment>;
      })}
    </>
  );
}
