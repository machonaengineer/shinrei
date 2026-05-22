import React from 'react';

export type AdminColumn<T> = {
  key: string;
  header: string;
  render: (row: T) => React.ReactNode;
  className?: string;
};

export function AdminTable<T extends { id: string }>({
  rows,
  columns,
  empty = 'データがありません',
}: {
  rows: T[];
  columns: AdminColumn<T>[];
  empty?: string;
}) {
  if (!rows.length) {
    return (
      <div className="surface-card p-8 text-center text-sm text-ink-dim">{empty}</div>
    );
  }
  return (
    <div className="surface-card overflow-x-auto">
      <table className="min-w-full text-sm">
        <thead className="bg-bg-soft text-ink-dim text-xs uppercase tracking-wide">
          <tr>
            {columns.map((c) => (
              <th key={c.key} className={`px-3 py-2 text-left font-medium ${c.className ?? ''}`}>
                {c.header}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => (
            <tr key={row.id} className="border-t border-bg-border align-top hover:bg-bg-soft/50">
              {columns.map((c) => (
                <td key={c.key} className={`px-3 py-2 ${c.className ?? ''}`}>
                  {c.render(row)}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
