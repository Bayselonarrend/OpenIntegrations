import React from 'react';

const CODE_SPLIT = /(`[^`]+`)/g;
const LINK_PATTERN = /\[([^\]]+)\]\(([^)]+)\)/g;

function renderTextWithLinks(text, keyPrefix) {
  const nodes = [];
  let lastIndex = 0;
  let linkIndex = 0;
  let match = LINK_PATTERN.exec(text);

  while (match) {
    if (match.index > lastIndex) {
      nodes.push(
        <React.Fragment key={`${keyPrefix}-text-${linkIndex}`}>
          {text.slice(lastIndex, match.index)}
        </React.Fragment>,
      );
    }

    const [, label, href] = match;
    nodes.push(
      <a key={`${keyPrefix}-link-${linkIndex}`} href={href} target="_blank" rel="noopener noreferrer">
        {label}
      </a>,
    );

    lastIndex = match.index + match[0].length;
    linkIndex += 1;
    match = LINK_PATTERN.exec(text);
  }

  LINK_PATTERN.lastIndex = 0;

  if (lastIndex < text.length) {
    nodes.push(
      <React.Fragment key={`${keyPrefix}-tail`}>{text.slice(lastIndex)}</React.Fragment>,
    );
  }

  return nodes.length > 0 ? nodes : text;
}

export default function ChangelogText({ children }) {
  if (!children) {
    return null;
  }

  const parts = String(children).split(CODE_SPLIT);

  return (
    <>
      {parts.map((part, index) => {
        if (part.startsWith('`') && part.endsWith('`')) {
          return <code key={index}>{part.slice(1, -1)}</code>;
        }

        return <React.Fragment key={index}>{renderTextWithLinks(part, `part-${index}`)}</React.Fragment>;
      })}
    </>
  );
}
